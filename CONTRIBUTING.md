# Contributing guide

## Common rules

Everyone who decided to contribute must respect the following restrictions:

 - Issues about **broken or mistyped configuration files**, **third-party**
   or **self-developed** packages are considered as *irrelevant* and will be
   rejected.

 - Personal support requests as well as personal feature requests will be
   rejected.
 
 - Unacceptible behaviour especially *trolling*, *spam* and so is forbidden
   here.

## Bug reports

If you are continuously observing "segmentation fault" or "Bad system call",
freezes, attempts to access non-existent files or similar behaviour, you
may [post a bug report](https://github.com/termux/unstable-packages/issues/new?template=bug_report.md).
Minimal amount of information that should be included into bug report consist of:

 - **Description**

   Clear description of the problem you encountered.

 - **Steps to reproduce**

   Exact steps to reproduce the problem.

 - **System information**

   Output of command `termux-info`.

Please do not post bug reports until you sure that your Termux installation
is consistent and up-to-date and configuration files do not contain typos.

## Package requests

Project [unstable-packages](https://github.com/termux/unstable-packages) do
not accept package requests.

## Pull requests

Pull requests are processed individually.

But in any case, all pull request should comply with the following restrictions:

 - Your changes should not break existing stuff.
 
 - Your scripts should not use `su` or `sudo` commands, perform undesirable actions
   like creating or deleting files outside of build environment directories.

Also, documentation in https://github.com/termux/termux-packages/tree/master/docs
may be useful.
