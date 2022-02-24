# Go mod mode

Go mod mode for `go.mod` and `go.sum`.

## Install

### MELPA

Not Available Yet

### Manual

* Install Swagger Codegen from https://github.com/nanjj/go-mod.el
* Download `go-mod.el`
* Put it in some directory like `~/.emacs.d/local/`
* Add this code into your Emacs configuration:

```
(add-to-list 'load-path
             (expand-file-name "local" user-emacs-directory))

(require 'go-mod)
```

