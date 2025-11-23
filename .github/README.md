# .github Directory

This directory contains GitHub-specific configuration files, templates, and workflows for the Rituals project.

## 📁 Directory Structure

```
.github/
├── ISSUE_TEMPLATE/          # Issue templates for bug reports, features, etc.
│   ├── bug_report.yml       # Report bugs and issues
│   ├── feature_request.yml  # Suggest new features
│   ├── ritual_balance.yml   # Report balance concerns
│   ├── documentation.yml    # Report documentation issues
│   ├── compatibility.yml    # Report mod/datapack conflicts
│   └── config.yml           # Issue template configuration
├── workflows/               # GitHub Actions CI/CD workflows
│   ├── build.yml           # Build and test on push/PR
│   └── release.yml         # Create releases from tags
├── PULL_REQUEST_TEMPLATE.md # PR template
├── CONTRIBUTING.md          # Contribution guidelines
├── SECURITY.md             # Security policy
├── FUNDING.yml             # Funding/support links
└── README.md               # This file
```

## 🎯 Issue Templates

We provide several issue templates to help organize and triage issues effectively:

### Bug Report (`bug_report.yml`)
For reporting bugs, glitches, or unexpected behavior. Includes:
- Installation type (Datapack/Mod)
- Version information
- Bug category (Totem, Ritual, Performance, etc.)
- Reproduction steps
- Configuration details
- Kiwi Mode status

**Use when**: Something isn't working as documented

### Feature Request (`feature_request.yml`)
For suggesting new features or improvements. Includes:
- Feature type (Ritual, Totem, QoL, etc.)
- Problem it solves
- Proposed implementation
- Theme and balance considerations

**Use when**: You have an idea for a new feature

### Ritual Balance (`ritual_balance.yml`)
For reporting balance concerns with existing rituals. Includes:
- Ritual type
- Totem tier
- Balance issue type (overpowered/underpowered)
- Impact on gameplay
- Suggested changes

**Use when**: A ritual feels too strong, too weak, or poorly balanced

### Documentation Issue (`documentation.yml`)
For reporting missing, incorrect, or unclear documentation. Includes:
- Documentation type
- Issue type (missing, incorrect, unclear, etc.)
- Document location
- Suggested improvement

**Use when**: The docs are wrong, missing, or confusing

### Compatibility Issue (`compatibility.yml`)
For reporting conflicts with other mods or datapacks. Includes:
- Conflicting mod information
- Conflict type (crash, visual, feature)
- Complete mod list
- Behavior comparisons

**Use when**: Rituals conflicts with another mod/datapack

## 🔄 Pull Request Template

The PR template (`PULL_REQUEST_TEMPLATE.md`) provides a comprehensive checklist for contributors:

- **Change Type**: Bug fix, feature, documentation, etc.
- **Testing Checklist**: General, component-specific, compatibility
- **Ritual Testing**: For ritual-specific changes
- **Documentation**: Updates required
- **Technical Details**: Architecture changes, performance impact

All PRs should fill out the relevant sections of this template.

## 🤝 Contributing Guidelines

See `CONTRIBUTING.md` for detailed contribution guidelines including:

- Development setup
- Project structure
- Coding standards
- Testing guidelines
- Commit message format
- Pull request process
- Design principles

**Required reading** before submitting a PR!

## 🔒 Security Policy

See `SECURITY.md` for:

- Supported versions
- How to report security vulnerabilities
- What qualifies as a security issue
- Response timeline
- Security best practices

**Never** report security issues publicly - use the private disclosure methods described.

## ⚙️ GitHub Actions Workflows

### Build Workflow (`workflows/build.yml`)

**Triggers**:
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop`
- Manual workflow dispatch

**Actions**:
1. Checks out the code
2. Sets up JDK 21
3. Builds with Gradle
4. Uploads artifacts (mod JAR, datapack ZIP, resourcepack ZIP)
5. Validates JSON files

**Purpose**: Ensures all commits build successfully and JSON is valid

### Release Workflow (`workflows/release.yml`)

**Triggers**:
- Push of version tags (e.g., `v1.3.0`)
- Manual workflow dispatch with version input

**Actions**:
1. Builds the project
2. Creates release notes template
3. Creates GitHub release (as draft)
4. Uploads all build artifacts

**Purpose**: Automates the release process

## 💰 Funding

The `FUNDING.yml` file configures the "Sponsor" button on GitHub. Currently links to:
- Twitch: https://www.twitch.tv/strixun

Update this file to add additional funding platforms (Patreon, Ko-fi, GitHub Sponsors, etc.)

## 📝 Template Usage Tips

### For Users

1. **Choose the right template** - Use the most specific template for your issue
2. **Fill in all required fields** - This helps us help you faster
3. **Be detailed** - More information = faster resolution
4. **Search first** - Check if your issue already exists

### For Maintainers

1. **Triage new issues** - Review and add appropriate labels
2. **Use saved replies** - Create saved replies for common questions
3. **Close duplicates** - Link to the original issue
4. **Update templates** - Improve based on recurring unclear submissions

## 🏷️ Recommended Labels

Common labels to use with these templates:

**Type**:
- `bug` - Something isn't working
- `enhancement` - New feature or improvement
- `documentation` - Documentation changes
- `compatibility` - Mod/datapack conflicts

**Priority**:
- `critical` - Game-breaking, needs immediate fix
- `high` - Important but not critical
- `medium` - Should be addressed
- `low` - Nice to have

**Status**:
- `needs-triage` - Needs initial review
- `needs-investigation` - Requires investigation
- `needs-review` - Awaiting review
- `in-progress` - Being worked on
- `blocked` - Blocked by something

**Component**:
- `totem` - Totem-related
- `ritual` - Ritual-related
- `fire-sacrifice` - Fire sacrifice system
- `pattern-ritual` - Multi-totem patterns
- `performance` - Performance/optimization
- `balance` - Game balance

## 🔧 Customization

### Adding a New Issue Template

1. Create a new `.yml` file in `ISSUE_TEMPLATE/`
2. Use the existing templates as examples
3. Test with a draft issue
4. Update this README

### Modifying Workflows

1. Edit the workflow YAML in `workflows/`
2. Test with a fork or branch first
3. Check the Actions tab for results
4. Document any new secrets or environment variables needed

### Updating PR Template

The PR template is plain Markdown. Edit freely, but keep:
- Change type checkboxes
- Testing checklist
- Documentation checklist
- Final pre-submission checks

## 📊 Workflow Status

Check workflow status:
- **Build**: [![Build](../../actions/workflows/build.yml/badge.svg)](../../actions/workflows/build.yml)
- **Release**: [![Release](../../actions/workflows/release.yml/badge.svg)](../../actions/workflows/release.yml)

## 📚 Additional Resources

- [GitHub Issue Template Docs](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [YAML Template Reference](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-issue-forms)

---

**Questions about these templates?** Open a discussion or ask on [Twitch](https://www.twitch.tv/strixun)!

