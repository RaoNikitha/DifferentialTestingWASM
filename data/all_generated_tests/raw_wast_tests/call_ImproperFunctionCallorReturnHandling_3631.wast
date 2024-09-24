;; Design an edge case where a function uses multiple return values, and subsequent operations depend on these values. Test if both implementations maintain stack integrity and return values placement or if discrepancies appear in subsequent operations.

(assert_invalid
  (module
    (func $multi-return-use
      (local $a i32) (local $b i32)
      (call 1)
      (local.set $a) (local.set $b)
      (i32.add (local.get $a) (local.get $b))
    )
    (func (result i32 i32) (i32.const 1) (i32.const 2))
  )
  "type mismatch"
)