;; 2. Write a function that includes a `nop` within a control flow, followed by a `br_table` with a negative index. Verify if the function terminates gracefully and consistently between WebAssembly and wizard_engine.

(assert_invalid
  (module
    (func $control_flow_with_nop
      (block
        (nop)
        (br_table -1 (i32.const 0))
      )
    )
  )
  "invalid branch depth"
)