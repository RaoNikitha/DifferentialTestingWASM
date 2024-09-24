;; 2. A loop structure contains a `br_if` with an `i32` constant non-zero value, testing if the implementation properly branches back to the beginning of the loop, instead of incorrectly continuing to the next instruction.

(assert_invalid
  (module
    (func $loop-branch
      (loop (br_if 0 (i32.const 1)))
      (unreachable)
    )
  )
  "unreachable code"
)