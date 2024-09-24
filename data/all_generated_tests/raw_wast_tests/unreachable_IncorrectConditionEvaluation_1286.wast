;; - **Test 7: Unreachable Inside Conditional Loop with Embedded Branching**   ```   Place `unreachable` inside a loop containing nested `if` conditions with `br_if` branches. The loop condition and nested conditions must evaluate correctly to hit the `unreachable`. Incorrect condition checking in nested branches should cause the differential behavior.   ``` -

(assert_invalid
  (module (func $type-unreachable-inside-conditional-loop-embedded-branching
    (loop
      (if (i32.const 1)
        (then
          (br_if 0 (i32.const 0))
          (unreachable)
        )
      )
    )
  ))
  "type mismatch"
)