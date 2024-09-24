;; Test 10: Construct a test where `nop` instructions are used between multiple local variable manipulations and stack operations within a single function. Validate that the stack's state and the integrity of local variables remain consistent.

(assert_invalid
  (module
    (func $test
      (local $x i32)
      (local $y i32)
      (local.set $x (i32.const 10))
      (local.set $y (i32.const 20))
      (nop)
      (local.get $x)
      (local.get $y)
      (i32.add)
      (nop)
      (drop)
      (local.set $x (i32.const 30))
      (nop)
      (local.get $x)
      (i32.const 5)
      (i32.mul)
      (nop)
      (drop)))
  "type mismatch"
)