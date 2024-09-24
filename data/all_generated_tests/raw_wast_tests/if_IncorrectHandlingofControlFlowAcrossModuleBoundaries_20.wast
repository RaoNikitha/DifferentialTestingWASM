;; 1. **Test Description**: A function containing an `if` instruction that calls an imported function within its `then` block. The imported function modifies global state used by the calling module. Incorrect handling of stack or global context could lead to corruption.    **Constraint**: The test checks if the control flow properly manages the global state transitions and ensures stack integrity post-call.    **Goal**: Detects improper initialization or resetting mechanisms.

(assert_invalid
  (module 
    (import "env" "modify_global" (func $modify_global (result i32)))
    (global $g (mut i32) (i32.const 0))
    (func $test_func
      (if (result i32) (i32.const 1) 
        (then 
          (call $modify_global)
          (global.set $g (i32.const 5))
        ) 
        (else
          (drop)
        )
      )
    )
  )
  "type mismatch"
)