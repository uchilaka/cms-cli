# CMS CLI

## Choosing TypeScript over Rack

It was fun learning about Thor and Minitest while working on the CMS CLI in Ruby. Ultimately, TypeScript and Javascript always feel like home to me, and when I need to move quickly on a project, I tend to reach for those well worn or at the very least most familiar (to me) tools.

## Supported Use cases

### Help for the CLI

```shell
# General help menu
yarn cli --help

# Command-specific help menu
yarn cli backup --help
```

### Generate your database backup script (dry run)

```shell
yarn cli backup --name ho_strapi_cms_dev --auth-db admin --outDir ~/Downloads --dry-run --verbose
```
