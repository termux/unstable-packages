# Contributing guide

Everyone who decided to contribute must respect the following restrictions:

- Issues about broken or mistyped configuration files, third-party or
self-developed packages will be rejected.

- Personal support requests will be rejected.

- Any kind of unacceptible behaviour (trolling, spam, etc...) is forbidden here.

## Bug reports

If you are constantly observing "segmentation fault" or "Bad system call",
freezes, attempts to access non-existent files or similar behaviour, you
may [submit a bug report][bug-report-template].

Each bug report should consist of:

- **Description**

	Clear description of the problem you encountered.

- **Steps to reproduce**

	Exact steps to reproduce the problem.

- **System information**

	Just post output of the `termux-info`.

Please do not post bug reports until you sure that your Termux installation
is consistent and up-to-date and configuration files do not contain typos.

## Package requests

Project [unstable-packages] does not accept package requests. Please submit them
to [termux-packages] instead.

## Pull requests

Pull requests are processed individually. But in any case, all pull requests
should comply with the following restrictions:

- Your changes should not break existing stuff.

- Your scripts should not use `su` or `sudo` commands, perform undesirable
actions like creating or deleting files outside of build environment directories.

Also, you may take a look on our documentation in [termux-packages/docs][termux-packages-docs].

[termux-packages]: <https://github.com/termux/termux-packages>
[termux-packages-docs]: <https://github.com/termux/termux-packages/tree/master/docs>
[unstable-packages]: <https://github.com/termux/unstable-packages>
[bug-report-template]: <https://github.com/termux/unstable-packages/issues/new?template=bug_report.md>
