import re

with open('raw.s', 'r') as f:
    content = f.read()

sections = content.split('bl 	DrawResult')

testnums = { }
for i, section in enumerate(sections):
    
    lines = section.splitlines()
    for idx, line in enumerate(lines):
        if line.lstrip().startswith('@'):
            section = '\n'.join(lines[idx:])
            break
    section = '\n'.join([line for line in section.splitlines() if line.strip().strip() != ''])

    if len(section) == 0:
        continue

    first_line = section.splitlines()[0] if section.splitlines() else ''
    name_match = re.match(r'^\s*@\s*(\S+)', first_line)
    if not name_match:
        raise Exception(f"Section {i} does not start with expected pattern:\n{section}")
    name = name_match.group(1)

    last_line = section.splitlines()[-1] if section.splitlines() else ''
    match = re.match(r'^\s*ldr\s+r0,=sz(.+)$', last_line)
    if not match:
        raise Exception(f"Section {i} does not end with expected pattern:\n{section}")
    
    value = match.group(1)

    section = '\n'.join(section.splitlines()[1:-1])

    if value != name:
        name = f'{value}: {name}'

    section = f"""@ {name}\n
.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
""" + section
    
    testnums.setdefault(value, 0)
    testnums[value] += 1

    with open(f'tests/{value}_{testnums[value]}.s', 'w') as out:
        out.write(section)