# EaNinja Tracker Client

## Encoding

Because of the limitations of github/bitbucket and MQL4, text files are encoded from **UTF-16** to **UTF-8** before being pushed to `origin`. A line including 2-byte characters are inserted in the beginning of each text files to ensure them being in UTF-16 format. Without it, MetaEditor may save it in ASCII.

```
# .gitattributes
*.mq4 filter=utf16
*.mqh filter=utf16
```

```
# .git/config
[filter "utf16"]
	clean = iconv -f utf-16le -t utf-8
	smudge = iconv -f utf-8 -t utf-16le
```
