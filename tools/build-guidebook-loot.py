#!/usr/bin/env python3
"""Regenerate data/rituals/loot_table/items/guidebook.json from give/guidebook.mcfunction pages."""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SOURCE = ROOT / "data/rituals/guidebook/pages.json"
OUTPUT = ROOT / "data/rituals/loot_table/items/guidebook.json"
OUTPUT_WELCOME = ROOT / "data/rituals/loot_table/items/guidebook_welcome.json"


def array_to_text_component(parts: list) -> dict:
    """Legacy book pages use [\"\", {...}, \"text\"] arrays — convert to {text, extra}."""
    if not parts:
        return {"text": ""}
    if isinstance(parts[0], str):
        component: dict = {"text": parts[0]}
        rest = parts[1:]
    elif isinstance(parts[0], dict):
        component = dict(parts[0])
        rest = parts[1:]
    else:
        component = {"text": ""}
        rest = parts
    if rest:
        component["extra"] = rest
    return component


def page_entry(page) -> dict | str:
    """Loot-table page entry Minecraft will render (not a stringified JSON blob)."""
    if isinstance(page, list):
        return {"raw": array_to_text_component(page)}
    if isinstance(page, dict):
        if "raw" in page or "filtered" in page:
            return page
        return {"raw": page}
    return {"raw": {"text": str(page)}}


def build_loot_table(page_sources: list, *, welcome: bool) -> dict:
    pages = [page_entry(p) for p in page_sources]
    components: dict = {
        "minecraft:written_book_content": {
            "title": "Rituals Guide",
            "author": "Ancient Ritualist",
            "generation": 0,
            "pages": pages,
        }
    }
    if welcome:
        components["minecraft:enchantments"] = {
            "minecraft:fortune": 3,
        }
        components["minecraft:attribute_modifiers"] = [
            {
                "type": "minecraft:luck",
                "id": "rituals:welcome_guidebook_luck_mainhand",
                "amount": 2.0,
                "operation": "add_value",
                "slot": "mainhand",
            },
            {
                "type": "minecraft:luck",
                "id": "rituals:welcome_guidebook_luck_offhand",
                "amount": 2.0,
                "operation": "add_value",
                "slot": "offhand",
            },
        ]
        components["minecraft:custom_name"] = {
            "text": "Rituals Guide",
            "color": "light_purple",
            "italic": False,
        }
        components["minecraft:lore"] = [
            {"text": "Ritualist's Blessing", "color": "gold", "italic": True},
            {"text": "Hold for +2 Luck while you read.", "color": "gray", "italic": True},
        ]

    return {
        "type": "minecraft:generic",
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:item",
                        "name": "minecraft:written_book",
                        "functions": [
                            {
                                "function": "minecraft:set_components",
                                "components": components,
                            }
                        ],
                    }
                ],
            }
        ],
    }


def load_pages_from_json(path: Path) -> list[dict]:
    data = json.loads(path.read_text(encoding="utf-8"))
    return data["pages"]


def extract_pages_from_mcfunction(text: str) -> list[str]:
    start = text.index("pages:[") + len("pages:[")
    depth = 1
    i = start
    while i < len(text) and depth:
        if text[i] == "[":
            depth += 1
        elif text[i] == "]":
            depth -= 1
        i += 1
    inner = text[start : i - 1]
    pages: list[str] = []
    j = 0
    while j < len(inner):
        while j < len(inner) and inner[j] in " \t\n,":
            j += 1
        if j >= len(inner):
            break
        if inner[j] != "'":
            raise ValueError(f"expected quote at {j}: {inner[j:j+30]!r}")
        j += 1
        begin = j
        while j < len(inner):
            if inner[j] == "'" and inner[j - 1] != "\\":
                break
            j += 1
        pages.append(inner[begin:j])
        j += 1
    return pages


def main() -> None:
    import sys

    if len(sys.argv) > 1:
        source = Path(sys.argv[1])
        if source.suffix == ".json":
            page_sources = load_pages_from_json(source)
        else:
            page_strings = extract_pages_from_mcfunction(source.read_text(encoding="utf-8"))
            page_sources = [json.loads(p) for p in page_strings]
    elif DEFAULT_SOURCE.is_file():
        page_sources = load_pages_from_json(DEFAULT_SOURCE)
    else:
        raise SystemExit(f"No source: pass mcfunction path or create {DEFAULT_SOURCE}")

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT.write_text(
        json.dumps(build_loot_table(page_sources, welcome=False), indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    OUTPUT_WELCOME.write_text(
        json.dumps(build_loot_table(page_sources, welcome=True), indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    print(f"Wrote {len(page_sources)} pages to {OUTPUT} and {OUTPUT_WELCOME}")


if __name__ == "__main__":
    main()
