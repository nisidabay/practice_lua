# Skill Registry — r_practice_lua

**Generated**: 2025-06-30
**Scope**: r_practice_lua

> Registry of available skills for agent use in this project. Skills are runtime
> instruction contracts — load with `skill_view(name)` to read full content.

## User-Level Skills

| Name | Trigger | Path | Scope |
|------|---------|------|-------|
| bash-scripting | Bash scripting patterns, best practices, and verification... | `~/.hermes/skills/bash-scripting` | user |
| branch-pr | Create Gentle AI pull requests... | `~/.hermes/skills/branch-pr` | user |
| chained-pr | Trigger: PRs over 400 lines, stacked PRs... | `~/.hermes/skills/chained-pr` | user |
| cognitive-doc-design | Design docs that reduce cognitive load... | `~/.hermes/skills/cognitive-doc-design` | user |
| comment-writer | Write warm, direct collaboration comments... | `~/.hermes/skills/comment-writer` | user |
| go-testing | Trigger: Go tests, go test coverage... | `~/.hermes/skills/go-testing` | user |
| issue-creation | Create Gentle AI issues with issue-first checks... | `~/.hermes/skills/issue-creation` | user |
| judgment-day | Trigger: judgment day, dual review... | `~/.hermes/skills/judgment-day` | user |
| karpathy-guidelines | Andrej Karpathy's LLM coding guidelines... | `~/.hermes/skills/software-development/karpathy-guidelines` | user |
| sdd-apply | Implement SDD tasks from specs and design... | `~/.hermes/skills/sdd-apply` | user |
| sdd-archive | Archive a completed SDD change... | `~/.hermes/skills/sdd-archive` | user |
| sdd-design | Create the SDD technical design... | `~/.hermes/skills/sdd-design` | user |
| sdd-explore | Explore SDD ideas before committing... | `~/.hermes/skills/sdd-explore` | user |
| sdd-init | Initialize SDD context, testing capabilities... | `~/.hermes/skills/sdd-init` | user |
| sdd-onboard | Walk users through the SDD workflow... | `~/.hermes/skills/sdd-onboard` | user |
| sdd-propose | Create an SDD change proposal... | `~/.hermes/skills/sdd-propose` | user |
| sdd-spec | Write SDD delta specs with requirements... | `~/.hermes/skills/sdd-spec` | user |
| sdd-tasks | Break an SDD change into implementation tasks... | `~/.hermes/skills/sdd-tasks` | user |
| sdd-verify | Trigger: SDD verification phase... | `~/.hermes/skills/sdd-verify` | user |
| skill-creator | Trigger: new skills, agent instructions... | `~/.hermes/skills/skill-creator` | user |
| skill-improver | Trigger: improve skills, audit skills... | `~/.hermes/skills/skill-improver` | user |
| skill-registry | Trigger: update skills, skill registry... | `~/.hermes/skills/skill-registry` | user |
| work-unit-commits | Plan commits as reviewable work units... | `~/.hermes/skills/work-unit-commits` | user |
| codebase-inspection | Inspect codebases w/ pygount... | `~/.hermes/skills/software-development/codebase-inspection` | user |
| test-driven-development | TDD: enforce RED-GREEN-REFACTOR... | `~/.hermes/skills/software-development/test-driven-development` | user |
| systematic-debugging | 4-phase root cause debugging... | `~/.hermes/skills/software-development/systematic-debugging` | user |
| wiki-code-standards | Standards for code examples... | `~/.hermes/skills/note-taking/wiki-code-standards` | user |
| teaching-code | Code teaching methodology... | `~/.hermes/skills/education/teaching-code` | user |
| crossover | For cross-project code improvements | `~/.config/opencode/skills/sdd-crossover` | user |
| c-review | Code review for C practice repos | `~/.config/opencode/skills/c-review` | user |
| snippet-extractor | Extract code snippets from files | `~/.config/opencode/skills/snippet-extractor` | user |
| tutorial-template | Generate structured tutorial files | `~/.config/opencode/skills/tutorial-template` | user |

## Project-Level Skills

None found — no project-level skill directory exists yet.

## Project Convention Files

None found — no AGENTS.md/CLAUDE.md/.cursorrules/etc. in project root.

## Notes

- Deduplication: project-level skills preferred over user-level where both exist. None present here.
- SDD skills (sdd-*) and _shared are excluded from normal task routing but listed for reference.
