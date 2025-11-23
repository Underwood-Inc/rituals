# Contributing to Rituals

Thank you for your interest in contributing to Rituals! This document provides guidelines and information for contributors.

## 🌟 Ways to Contribute

### 1. Report Bugs
Found a bug? Please [open a bug report](../../issues/new?template=bug_report.yml) with:
- Clear reproduction steps
- Expected vs actual behavior
- Your Minecraft and Rituals version
- Any relevant logs or screenshots

### 2. Suggest Features
Have an idea? [Submit a feature request](../../issues/new?template=feature_request.yml)!
- Check [Coming Soon Rituals](docs/COMING_SOON_RITUALS.md) first
- Explain the problem it solves
- Consider balance and theme fit

### 3. Improve Documentation
Documentation is always welcome!
- Fix typos or unclear explanations
- Add examples or clarifications
- Improve formatting or organization
- Create visual guides or diagrams

### 4. Submit Code
Ready to code? Read on!

## 🛠️ Development Setup

### Prerequisites
- Java Development Kit (JDK) 21 or higher
- Gradle (included via wrapper)
- Git
- A text editor or IDE (IntelliJ IDEA recommended)

### Getting Started

1. **Fork the repository**
   ```bash
   # Fork via GitHub UI, then clone your fork
   git clone https://github.com/YOUR_USERNAME/rituals.git
   cd rituals
   ```

2. **Build the project**
   ```bash
   # Windows
   gradlew.bat build
   
   # Linux/Mac
   ./gradlew build
   ```

3. **Run in development**
   ```bash
   # Generate Minecraft run configurations
   ./gradlew genSources
   
   # Run Minecraft client
   ./gradlew runClient
   ```

See [docs/BUILD_GUIDE.md](docs/BUILD_GUIDE.md) for detailed build instructions.

## 📁 Project Structure

```
rituals/
├── data/                       # Datapack files (.mcfunction, JSON)
│   ├── rituals/
│   │   ├── function/          # Minecraft functions
│   │   ├── advancement/       # Achievement system
│   │   ├── recipe/           # Crafting recipes
│   │   └── tags/             # Custom tags
│   └── minecraft/
│       └── tags/function/    # Load/tick hooks
├── resourcepack/              # Custom textures and models
│   └── assets/
│       ├── rituals/          # Custom models
│       └── minecraft/        # Model overrides
├── src/main/java/            # Fabric mod code (commands, config)
│   └── com/rituals/
├── docs/                      # Documentation
├── images/                    # README images
└── build.gradle              # Build configuration
```

## 💻 Coding Standards

### Minecraft Functions (.mcfunction)
- Use clear, descriptive function names
- Add comments for complex logic
- Follow existing scoreboard naming conventions:
  - `rituals.data` - Constants
  - `rituals.timer` - Tick counters
  - `rituals.tier` - Totem tiers
  - `rituals.temp` - Temporary calculations
- Keep functions focused and modular
- Use storage for persistent data: `rituals:config`, `rituals:temp`

### Java Code
- Follow standard Java naming conventions
- Use meaningful variable and method names
- Add Javadoc comments for public methods
- Keep methods focused on a single responsibility
- Handle errors gracefully

### JSON Files
- Use proper indentation (2 or 4 spaces)
- Validate JSON syntax before committing
- Follow Minecraft's data pack format specification

## 🧪 Testing Guidelines

Before submitting a PR, test thoroughly:

### Functional Testing
- [ ] Test in both **singleplayer** and **multiplayer**
- [ ] Test with **Kiwi Mode** on and off
- [ ] Test all **totem tiers** (Wood through Netherite)
- [ ] Test both **tall and short** totem variants
- [ ] Verify **fire sacrifice** mechanics work
- [ ] Check **ritual effects** apply correctly
- [ ] Test **pattern rituals** (if multi-totem)
- [ ] Verify **advancements** trigger properly
- [ ] Test **edge cases** and unusual scenarios

### Performance Testing
- Monitor tick time with `/debug start` and `/debug stop`
- Check entity count with F3 debug screen
- Test with multiple active rituals
- Verify no memory leaks over extended play

### Compatibility Testing
- Test with Fabric API only (minimal setup)
- Test with common mod combinations
- Ensure no conflicts with vanilla mechanics
- Verify backwards compatibility with existing worlds

## 🎨 Adding New Rituals

When adding a new ritual, include:

1. **Function Files** - Core ritual logic
   - `data/rituals/function/ritual/[name]/`
   - Activation checks
   - Effect application
   - Cleanup logic

2. **Advancement** - Progression system
   - `data/rituals/advancement/guide/[name].json`
   - `data/rituals/advancement/hidden/specific/[name]_master.json`
   - Count tracking advancements

3. **Documentation**
   - Update `README.md` with ritual description
   - Add details to `docs/PATTERN_RITUALS_GUIDE.md` if applicable
   - Include example usage

4. **Testing**
   - All totem tiers
   - Fire sacrifice costs
   - Effect ranges and durations
   - Visual effects (particles)
   - Balance considerations

## 📝 Commit Guidelines

### Commit Message Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code restructuring without behavior change
- `perf`: Performance improvements
- `test`: Adding tests
- `chore`: Maintenance tasks

### Examples
```
feat(ritual): add Time Warp ritual with Clock pattern

Implements the Time Warp ritual that accelerates time in the area.
Requires 9 totems in a circle pattern with a Clock in the center.

Fixes #123
```

```
fix(totem): correct breaking animation for Netherite totems

Netherite totems were showing incorrect particles during breaking.
Changed from stone to crying obsidian particles at final stage.

Fixes #456
```

## 🔍 Pull Request Process

1. **Create a feature branch**
   ```bash
   git checkout -b feat/my-new-ritual
   ```

2. **Make your changes**
   - Write clear, modular code
   - Add comments where needed
   - Update documentation

3. **Test thoroughly**
   - Follow testing guidelines above
   - Fix any bugs you find

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat(ritual): add awesome new ritual"
   ```

5. **Push to your fork**
   ```bash
   git push origin feat/my-new-ritual
   ```

6. **Open a Pull Request**
   - Use the PR template
   - Fill out all relevant sections
   - Link related issues
   - Add screenshots/videos if applicable

7. **Address review feedback**
   - Respond to comments
   - Make requested changes
   - Push updates to the same branch

8. **Merge**
   - Once approved, a maintainer will merge
   - Your changes will be in the next release!

## ⚖️ Design Principles

When contributing, keep these principles in mind:

### 1. **Balance**
- New features should fit the game's progression
- Avoid making existing content obsolete
- Consider costs vs. benefits
- Higher tiers = more power, but higher costs

### 2. **Theme**
- Maintain the mystical/magical aesthetic
- Rituals should feel intentional and significant
- Fire sacrifice adds ceremony and cost
- Visual effects should be enchanting but not overwhelming

### 3. **Performance**
- Minimize command executions per tick
- Use predicates for randomness
- Batch entity operations
- Consider server impact

### 4. **User Experience**
- Clear, intuitive mechanics
- Helpful error messages
- Good documentation
- Progression feels rewarding

### 5. **Compatibility**
- Work with vanilla Minecraft
- Doesn't break existing worlds
- Respect other datapacks/mods
- Maintain backwards compatibility

## 🎯 Priority Areas

We especially welcome contributions in:

1. **Planned Rituals** - Implement rituals from [COMING_SOON_RITUALS.md](docs/COMING_SOON_RITUALS.md)
2. **Performance** - Optimize tick functions and entity operations
3. **Balance** - Fine-tune ritual costs, effects, and durations
4. **Visuals** - Improve particle effects, models, and textures
5. **Documentation** - Expand guides, add examples, create diagrams
6. **Testing** - Report edge cases and unusual scenarios

## 📜 Code of Conduct

### Our Standards

- Be respectful and welcoming
- Accept constructive criticism gracefully
- Focus on what's best for the community
- Show empathy towards others

### Unacceptable Behavior

- Harassment, trolling, or insulting comments
- Personal or political attacks
- Publishing others' private information
- Other unprofessional conduct

## 📞 Getting Help

- **Documentation**: Check [docs/README.md](docs/README.md)
- **Issues**: Search existing issues first
- **Discussions**: Use GitHub Discussions for questions
- **Live**: Watch development on [Twitch](https://www.twitch.tv/strixun)

## 📄 License

By contributing to Rituals, you agree that your contributions will be licensed under the same terms as the project (see LICENSE file).

## 🙏 Recognition

Contributors will be recognized in:
- CHANGELOG.md for their specific contributions
- Special thanks in documentation
- Community appreciation!

---

**Thank you for contributing to Rituals!** 🔮

Your efforts help make this datapack better for the entire Minecraft community.

