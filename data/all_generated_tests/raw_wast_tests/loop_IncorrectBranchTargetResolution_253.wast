;; Test 4: A combination of `loop`, `block`, and `if` instructions where a conditional branch (`br_if`) targets an enclosing loop. Misinterpreting label indices will send the branch to the wrong target, causing execution faults.

(assert_invalid
  (module
    (func $test4
      (i32.const 1)
      (block (result i32)
        (loop (result i32)
          (if (result i32) 
            (i32.const 0)
            (then 
              (br_if 1 (i32.const 1))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)