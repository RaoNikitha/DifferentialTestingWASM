;; 9. **Mixed Control Flow Resumption Test**: Develop a scenario with mixed `block`, `if`, and `loop` structures, executing complex interactions among them with multiple `br` instructions challenging the CFG resumption rules. This ensures the CFG accommodates complex control flow resumption correctly.

(assert_invalid
  (module
    (func $mixed-control-flow-resumption
      (block
        (i32.const 0)
        (block
          (loop
            (if (result i32)
              (then (br 1))
            )
            (br 0)
          )
        )
        (br 2)
        (i32.const 1)
      )
      (drop)
    )
  )
  "type mismatch"
)