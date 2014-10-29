# AtomPair  FE    512A  FE  513A  HARMONIC 3.1 0.01

def enzdes(a1, a2, r1, r2, x, sd):
  return '''
    CST::BEGIN
      TEMPLATE:: ATOM_MAP: 1 atom_type: %s
      TEMPLATE:: ATOM_MAP: 2 atom_type: %s
      TEMPLATE:: ATOM_MAP: 1 residue1: %s
      TEMPLATE:: ATOM_MAP: 2 residue3: %s 
      CONSTRAINT:: distanceAB: %d %d 100 1 1 
    CST::END''' % (a1, a2, r1, r2, x, sd)

with open('fe.cst') as fe:
  for l in fe:
    l = l.split()
    print( enzdes( "GLU", "Fe3p", "E", "FE ", 2.1, 0.1  ) )
