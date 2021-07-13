println("Starting to build PDF. This may take a while.")

import Pkg

Pkg.activate(".")
Pkg.update()
Pkg.instantiate()

using BayesianAssignment

build_pdf()
