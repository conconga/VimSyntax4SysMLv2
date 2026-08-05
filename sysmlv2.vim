" Vim syntax file
" Language: SysML v2 (including its KerML foundation)
" Maintainer: sysmlv2_vim contributors

if exists("b:current_syntax")
  finish
endif

syn case match

" KerML and common language keywords.  Keep these here rather than sourcing a
" second file so this syntax file can be installed and used on its own.
syn keyword sysmlv2Keyword about abstract alias all and as assoc behavior binding bool by chains
syn keyword sysmlv2Keyword class classifier comment composite conjugate conjugates conjugation
syn keyword sysmlv2Keyword connector datatype default dependency derived differences disjoining
syn keyword sysmlv2Keyword disjoint doc else end expr feature featured featuring filter first
syn keyword sysmlv2Keyword flow for from function hastype if implies import in inout interaction
syn keyword sysmlv2Keyword intersects inv inverse inverting istype language library locale member
syn keyword sysmlv2Keyword meta metaclass metadata multiplicity namespace nonunique not of or
syn keyword sysmlv2Keyword ordered out package portion predicate private protected public readonly
syn keyword sysmlv2Keyword redefines redefinition references rep return specialization specializes
syn keyword sysmlv2Keyword standard step struct subclassifier subset subsets subtype succession
syn keyword sysmlv2Keyword then to type typed typing unions xor

" SysML-specific definitions, usages, relationships and behavioral notation.
syn keyword sysmlv2Keyword accept action actor after allocate allocation analysis assert assign
syn keyword sysmlv2Keyword assume at attribute bind calc case concern connect connection constraint
syn keyword sysmlv2Keyword decide def defined do entry enum event exhibit exit expose fork frame
syn keyword sysmlv2Keyword include individual interface item join loop merge message objective
syn keyword sysmlv2Keyword occurrence parallel part perform port ref render rendering require
syn keyword sysmlv2Keyword requirement satisfy send snapshot stakeholder state subject timeslice
syn keyword sysmlv2Keyword transition until use variant variation verification verify via view
syn keyword sysmlv2Keyword viewpoint when while

" Literal values and predefined scalar types.
syn keyword sysmlv2Boolean true false
syn keyword sysmlv2Constant null
syn keyword sysmlv2Type Boolean Integer Natural Real Rational String UnlimitedNatural

" Names may be quoted when they contain spaces or reserved words.  SysML uses
" doubled apostrophes inside quoted names.
syn region sysmlv2QuotedName start=+'+ skip=+''+ end=+'+ oneline

" Strings support the usual backslash escapes; an unfinished string is marked
" as an error without consuming following lines.
syn match  sysmlv2Escape contained +\\\([btnfr"'\\]\|u[0-9A-Fa-f]\{4}\)+
syn match  sysmlv2BadEscape contained +\\[^btnfr"'\\u]+
syn region sysmlv2String start=+"+ skip=+\\"+ end=+"+ oneline contains=sysmlv2Escape,sysmlv2BadEscape

" Decimal, scientific, hexadecimal and binary numeric literals.  Vim gives a
" later rule precedence at the same position, so floats follow integers.
syn match sysmlv2Number +\<0[xX][0-9A-Fa-f]\+\>+
syn match sysmlv2Number +\<0[bB][01]\+\>+
syn match sysmlv2Number +\<\d\+\>+
syn match sysmlv2Float  +\<\d\+\.\d*\([eE][+-]\=\d\+\)\=\>+
syn match sysmlv2Float  +\<\d\+[eE][+-]\=\d\+\>+
syn match sysmlv2Multiplicity +\[\s*\(\d\+\|\*\)\s*\(\.\.\s*\(\d\+\|\*\)\s*\)\=\]+

" Remaining expression, navigation and namespace operators.
syn match sysmlv2Operator +::\|==\|!=\|<>\|<=\|>=\|&&\|||\|\.\.\|\*\*\|[=<>+*/%!?&|^~.-]+
syn match sysmlv2Delimiter +[{}()[\],;:]+
syn match sysmlv2Metadata +@\ze\s*\%([A-Za-z_]\|'\)+

" Relationship shorthand and arrow operators.  These follow the generic
" operator rules so each shorthand is highlighted as one complete token.
syn match sysmlv2Shorthand +:>>\|:>+
syn match sysmlv2Arrow +<->\|-->>\|->>\|<<-\|=>\|->\|<-+

" Documentation and regular comments.  Comment definitions deliberately come
" after operators so comment text always has precedence over '/' and '*'.
syn region sysmlv2DocComment start=+/\*\*+ end=+\*/+ contains=@Spell
syn region sysmlv2BlockComment start=+/\*+ end=+\*/+ contains=@Spell
syn match  sysmlv2LineComment +//.*$+ contains=@Spell

hi def link sysmlv2Keyword       Keyword
hi def link sysmlv2Boolean       Boolean
hi def link sysmlv2Constant      Constant
hi def link sysmlv2Type          Type
hi def link sysmlv2QuotedName    Identifier
hi def link sysmlv2String        String
hi def link sysmlv2Escape        SpecialChar
hi def link sysmlv2BadEscape     Error
hi def link sysmlv2Number        Number
hi def link sysmlv2Float         Float
hi def link sysmlv2Multiplicity  Number
hi def link sysmlv2Shorthand     Special
hi def link sysmlv2Arrow         Operator
hi def link sysmlv2Operator      Operator
hi def link sysmlv2Delimiter     Delimiter
hi def link sysmlv2Metadata      PreProc
hi def link sysmlv2DocComment    SpecialComment
hi def link sysmlv2BlockComment  Comment
hi def link sysmlv2LineComment   Comment

let b:current_syntax = "sysmlv2"
