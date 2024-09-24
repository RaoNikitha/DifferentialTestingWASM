;; 7. Develop a test where a WebAssembly function employs `br_table` to branch among multiple labels that include local blocks and a call to a function exported by a different module. Examine the operand stack management for correctness during the branch to the exported function.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (param i32) (result i32)
      (block $B1 (result i32)
        (loop $L1 (result i32)
          (block $B2 (result i32)
            (br_table $B2 $B1 $L1 2 (local.get 0))
          )
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)