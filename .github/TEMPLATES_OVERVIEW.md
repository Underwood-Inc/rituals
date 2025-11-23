# GitHub Templates Overview

This document provides a quick overview of all GitHub templates created for the Rituals project.

## ✅ What Was Created

### 📋 Issue Templates (5)

1. **Bug Report** (`bug_report.yml`)
   - Comprehensive bug reporting with Rituals-specific fields
   - Categories: Totem, Ritual, Fire Sacrifice, Pattern Rituals, etc.
   - Includes Kiwi Mode status, config, and version info
   - Pre-submission checklist

2. **Feature Request** (`feature_request.yml`)
   - Structured feature suggestions
   - Problem/solution framework
   - Theme and balance considerations
   - Checks against planned features (COMING_SOON_RITUALS.md)

3. **Ritual Balance** (`ritual_balance.yml`)
   - Specific template for balance concerns
   - All 8 ritual types included
   - Impact assessment and suggested changes
   - Game stage consideration

4. **Documentation Issue** (`documentation.yml`)
   - Report doc bugs, unclear info, or missing content
   - Covers all doc types (README, guides, technical docs)
   - Issue types: missing, incorrect, unclear, typos, etc.

5. **Compatibility Issue** (`compatibility.yml`)
   - Report mod/datapack conflicts
   - Detailed testing checklist
   - Crash log support
   - Complete mod list requirement

### ⚙️ Configuration Files (2)

6. **Issue Template Config** (`config.yml`)
   - Links to Twitch, Documentation, Discussions
   - Directs questions away from Issues to Discussions

7. **Funding Links** (`FUNDING.yml`)
   - Currently links to Twitch stream
   - Ready to add Patreon, Ko-fi, GitHub Sponsors, etc.

### 🔄 Workflows (2)

8. **Build Workflow** (`workflows/build.yml`)
   - Runs on push/PR to main/develop
   - Builds mod, datapack, and resourcepack
   - Validates all JSON files
   - Uploads artifacts
   - Build summary in GitHub Actions

9. **Release Workflow** (`workflows/release.yml`)
   - Triggered by version tags (v1.3.0, etc.)
   - Creates GitHub releases as drafts
   - Uploads all build artifacts
   - Generates release notes template

### 📝 Documentation (4)

10. **Pull Request Template** (`PULL_REQUEST_TEMPLATE.md`)
    - Comprehensive PR checklist
    - Type of change checkboxes
    - General, component, and ritual-specific testing
    - Documentation requirements
    - Technical details section
    - Maintainer review checklist

11. **Contributing Guidelines** (`CONTRIBUTING.md`)
    - Complete contribution guide (350+ lines!)
    - Development setup instructions
    - Project structure explanation
    - Coding standards (mcfunction, Java, JSON)
    - Testing guidelines
    - Commit message format
    - PR process
    - Design principles
    - Priority areas for contribution

12. **Security Policy** (`SECURITY.md`)
    - Supported versions
    - Vulnerability reporting process
    - Security best practices
    - What qualifies as a security issue
    - Response timeline

13. **.github README** (`README.md`)
    - Documentation for the templates themselves
    - Directory structure
    - Template usage tips
    - Recommended labels
    - Customization guide

## 🎯 Template Features

### Context-Aware
Every template is tailored to Rituals specifically:
- References actual ritual types (Growth, Strength, etc.)
- Includes totem tiers (Wood through Netherite)
- Mentions fire sacrifice system and Kiwi Mode
- Links to existing documentation
- Refers to pattern rituals and multi-totem mechanics

### Comprehensive Checklists
All templates include verification steps:
- Pre-submission checks
- Testing requirements
- Documentation updates
- Compatibility verification

### Well-Organized
Templates use clear categorization:
- Dropdowns for common options
- Required vs optional fields
- Proper formatting and markdown
- Code blocks for logs and configs

## 📊 Template Statistics

- **Total Files Created**: 13
- **Issue Templates**: 5
- **Workflows**: 2
- **Documentation Files**: 4
- **Config Files**: 2
- **Total Lines of Code**: ~1,400+
- **Coverage**: Bug reports, features, balance, docs, compatibility, PRs, contributing, security

## 🎨 Design Principles

These templates were designed with:

1. **Specificity** - Tailored to Minecraft datapacks/mods
2. **Completeness** - Cover all common scenarios
3. **Clarity** - Clear instructions and examples
4. **Efficiency** - Help maintainers triage quickly
5. **Community** - Encourage quality contributions

## 🚀 Quick Start for Contributors

1. **Reporting a Bug**
   → Use **Bug Report** template
   → Include version, reproduction steps, config

2. **Suggesting a Feature**
   → Use **Feature Request** template
   → Check COMING_SOON_RITUALS.md first
   → Consider balance and theme

3. **Balance Concern**
   → Use **Ritual Balance** template
   → Specify ritual and tier
   → Suggest specific changes

4. **Documentation Fix**
   → Use **Documentation Issue** template
   → Quote current content
   → Provide suggested improvement

5. **Mod Conflict**
   → Use **Compatibility Issue** template
   → List ALL mods
   → Include crash logs if applicable

6. **Submitting Code**
   → Read **CONTRIBUTING.md** first
   → Fill out **Pull Request Template**
   → Complete all testing checklists

## 🔧 Customization Notes

### Easy to Update
- **Add ritual types**: Update dropdown options in templates
- **Add totem tiers**: Update tier lists in bug_report.yml and ritual_balance.yml
- **Add documentation**: Update documentation.yml dropdown
- **Modify workflows**: Edit YAML files in workflows/

### Integration Points
Templates reference:
- `docs/COMING_SOON_RITUALS.md` - Planned features
- `docs/README.md` - Documentation index
- Main `README.md` - Project overview
- Twitch stream - https://www.twitch.tv/strixun

### GitHub Features Used
- **Issue Forms** (YAML) - Structured, validated inputs
- **GitHub Actions** - Automated builds and releases
- **Saved Replies** - Suggested for maintainers
- **Issue Labels** - Template suggests label scheme
- **Discussions** - Redirect questions from Issues

## 📈 Expected Benefits

### For Users
- ✅ Easier to report issues with guided forms
- ✅ Get help faster with complete information
- ✅ Know what to expect from the process

### For Maintainers
- ✅ Better organized issues
- ✅ All necessary info up front
- ✅ Easier to triage and prioritize
- ✅ Automated builds catch issues early
- ✅ Standardized PR reviews

### For Contributors
- ✅ Clear contribution guidelines
- ✅ Know what testing is required
- ✅ Understand project standards
- ✅ Know where to make changes

## 🎓 Learning Resources

If you're new to GitHub templates:
- [GitHub Issue Forms](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-issue-forms)
- [GitHub Actions](https://docs.github.com/en/actions)
- [Contributing Guides](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions)

## 💡 Best Practices

### For Issue Templates
1. Required fields for critical info only
2. Provide examples in placeholders
3. Use dropdowns for known options
4. Include pre-submission checks
5. Link to relevant documentation

### For Workflows
1. Run on feature branches, not just main
2. Upload artifacts for debugging
3. Fail fast with clear error messages
4. Use caching for dependencies
5. Generate summaries for visibility

### For PR Template
1. Make testing explicit
2. Require documentation updates
3. Include maintainer checklist
4. Support all change types
5. Link to related issues

## 🔮 Future Enhancements

Potential additions:
- **Discussion templates** for Q&A, ideas, polls
- **Project boards** for roadmap tracking
- **Automated labeling** based on template choices
- **Stale issue management** workflow
- **Dependency updates** (Dependabot)
- **Code quality checks** (linting in workflows)

## 🤝 Maintenance

These templates should be reviewed:
- **Quarterly** - Update for new features/rituals
- **Version bumps** - Update version numbers
- **After major changes** - Ensure templates reflect current architecture
- **Based on feedback** - Improve based on usage

## 📞 Questions?

- Open a **Discussion** for template questions
- Watch development on **[Twitch](https://www.twitch.tv/strixun)**
- Check **[Documentation](../docs/README.md)**

---

**Created**: November 2025
**For**: Rituals Minecraft Datapack/Mod
**Version**: 1.3.0

