;; 3. Construct a module that contains a `block` of instructions including a `call` to an imported function. Place `nop` between the `block` and `call`. The imported function should perform multiple stack operations. This will test if the `nop` causes any disruption in the execution flow or stack handling between module boundaries.

(assert_invalid
  (module
    (func $importFunc (import "env" "imported_func"))
    (func $test
      (block
        nop
        call $importFunc
      )
    )
  )
  "type mismatch"
)