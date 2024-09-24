;; 9. Create a `loop` with instructions that consume and produce different numbers of stack values per iteration. Ensure that the changing stack height is correctly managed and remains consistent throughout the execution.

(assert_invalid
  (module (func $type-stack-height-mismatch
    (block (loop (result i32)
      (i32.const 0)
      (br 1)
      (i32.const 0)
      (i32.add)
    ))
  ))
  "type mismatch"
)