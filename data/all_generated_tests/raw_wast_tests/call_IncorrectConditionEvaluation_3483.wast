;; **Test 2**: Test a call instruction with an index higher than any function defined in the module. Verify the implementation of the `func` context lookup and out-of-bounds index handling.

(assert_invalid
  (module
    (func $f (call 10))
  )
  "unknown function"
)