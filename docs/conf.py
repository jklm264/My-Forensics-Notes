#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
import re

from pygments_lexer_solidity import SolidityLexer, YulLexer

# The suffix of source filenames.
source_suffix = '.rst'
# The master toctree document.
master_doc = 'index'
