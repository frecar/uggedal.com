#!/usr/bin/env python

import sys

import pygments
import pygments.formatters
import pygments.lexers
import hoedown as h

exts = h.EXT_NO_INTRA_EMPHASIS | h.EXT_TABLES | h.EXT_FENCED_CODE

class Renderer(h.HtmlRenderer, h.SmartyPants):
    formatter = pygments.formatters.HtmlFormatter()

    def block_code(self, text, lang):
        try:
            lexer = pygments.lexers.get_lexer_by_name(lang)
        except ValueError:
            lexer = pygments.lexers.TextLexer()
        return pygments.highlight(text, lexer, self.formatter)

print(h.Markdown(Renderer(0), exts).render(sys.stdin.read()))
