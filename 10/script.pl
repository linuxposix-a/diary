#!/usr/bin/perl -0777 -p -i
s/:\s*\[\K\n.*?(?=\])/$&=~s@\s+@@rgs/egs;
