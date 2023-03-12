#! /usr/bin/env python

import sys
import os
import clams

from clams.source import SourceCli
from contextlib import redirect_stdout


out_dir = sys.argv[1]

os.makedirs(out_dir, exist_ok=True)

docs = {}
for document in sys.argv[2:]:
    doc_type, doc_id = document.split(':')
    doc_ids = docs.get(doc_type, [])
    doc_ids.append(doc_id)
    docs[doc_type] = doc_ids
num_docs = map(len, docs.values())
num_docs = set(num_docs)
assert len(num_docs) == 1

for i in range(list(num_docs)[0]):
    f = open(os.path.join(out_dir, f'{i:08d}.json'), 'w')
    cmd = SourceCli()
    args = []
    for doc_type, doc_ids in docs.items():
        doc_id = doc_ids[i]
        args.append(f"{doc_type}:{doc_id}")
    cmd.args = args
    with redirect_stdout(f):
        cmd.run()
    f.close()


