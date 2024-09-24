;; 5. Create a WebAssembly module that utilizes `br_table` within a function that branches to different blocks, including one that calls a function exported by another module. Ensure that the operand stack and label indices are correctly managed across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32)))
    (func $test
      (block $label0
        (block $label1
          (block $label2
            (i32.const 10) ;; This operand from the stack
            (br_table $label1 $label2 $label0 99) ;; operand out of bounds
          )
        )
      )
    )
  )
  "unknown label"
)