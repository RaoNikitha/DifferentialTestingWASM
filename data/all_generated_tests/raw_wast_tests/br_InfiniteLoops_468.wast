;; - **Test 9:**    A `loop` that includes a `br_if` targeting a higher depth. The condition check always results in jumping back to the higher depth without breaking the sequence, causing the loop to run infinitely.

(assert_invalid
  (module
    (func $loop-br_if (loop (block (br_if 1 (i32.const 1)))))
  )
  "invalid branch"
)