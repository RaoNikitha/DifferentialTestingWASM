;; 8. Implement a test where a function chain involves multiple modules: module A imports and calls from B, B imports and calls from C. Test for proper stacking and control flow transitions where cross-module interactions are deeply nested, revealing potential cascading control flow malfunctions.

(assert_invalid
  (module
    (import "B" "funcB" (func $funcB))
    (func $funcA
      (call $funcB)
    )
  )
  "undefined function reference in import"
)

(module
  (import "C" "funcC" (func $funcC))
  (func $funcB
    (call $funcC)
  )
)

(module
  (func $funcC
    (nop)
  )
)