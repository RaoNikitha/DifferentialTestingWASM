;; 3. **Broken Conditional Branch inside a Loop**: Test with an `if` inside a `loop` where the `then` branch contains a `br_if` condition that is always false. Check if the loop exits correctly as per the conditions or becomes an infinite loop.

(assert_invalid
  (module
    (func
      (loop
        (if (i32.const 0) (then (br_if 0 (i32.const 1))))
      )
    )
  )
  "type mismatch"
)