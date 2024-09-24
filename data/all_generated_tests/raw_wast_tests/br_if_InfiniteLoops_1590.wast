;; 1. Test an infinite loop where `br_if` attempts to exit the loop when the top of the stack is zero. If the `wizard_engine` incorrectly handles the side-table entries, the loop won't break, causing an infinite loop.

(assert_invalid
  (module
    (func $infinite-loop-break 
      (loop (result i32)
        (br_if 0 (i32.const 0))
      )
      (drop)
    )
  )
  "type mismatch"
)