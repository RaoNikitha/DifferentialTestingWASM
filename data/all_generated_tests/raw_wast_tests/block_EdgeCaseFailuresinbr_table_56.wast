;; - **Test 7**: Incorporate a `block` with multiple branches and a `br_table` that jumps to a label index that would have unwinding issues due to overlapping labels. Evaluate how `wizard_engine` adjusts the `ctl_stack` to manage unwinding, compared to WebAssembly's stack height tracking.

(assert_invalid
  (module
    (func $overlapping-labels-unwind
      (block $outer (result i32)
        (block $inner
          (br_table 0 1 0  ; Switches between $inner and $outer, potential unwind issue due to overlapping
            (i32.const 0)
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)