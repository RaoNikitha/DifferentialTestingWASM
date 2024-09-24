;; 9. Develop a WebAssembly module with a `block` containing a switch-like structure with nested `if` and `loop` constructs. Have a `br` target the outer structure under specific conditions and place `unreachable` instructions at the default and edge cases, checking if the control flow reaches the intended branch target without triggering `unreachable` executions.

(assert_invalid
  (module
    (func
      (block
        (loop (br 1))
        (if (i32.const 1)
          (block (br 1))
          (block (br 1))
        )
        (unreachable)
      )
    )
  )
  "unknown label"
)