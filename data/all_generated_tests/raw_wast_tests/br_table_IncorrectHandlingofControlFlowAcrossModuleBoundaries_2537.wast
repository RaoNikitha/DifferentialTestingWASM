;; 6. Construct a WebAssembly function using `br_table` to branch either to local labels or to a function imported from another module. Check the implementation for proper control flow handling and fidelity in operand type matching when transitioning between modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (block $label1
        (block $label2
          (i32.const 1) (br_table $label1 $label2 1)
        )
      )
      (call $external_func)
    )
  )
  "type mismatch"
)