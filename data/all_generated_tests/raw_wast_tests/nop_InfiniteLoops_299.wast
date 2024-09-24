;; Test 10: Combine `nop` with variable updates and `br_if` within a loop. Ensure that the presence of `nop` does not interfere with the condition checks or exit mechanism, preventing infinite loops.

(assert_invalid
  (module
    (func $loop_nop (param i32) (result i32)
      (local i32)
      loop
        get_local 0
        i32.const 0
        i32.eq
        br_if 1
        nop
        get_local 0
        i32.const 1
        i32.sub
        set_local 0
        br 0
      end
      get_local 0
    )
  )
  "function result type mismatch"
)