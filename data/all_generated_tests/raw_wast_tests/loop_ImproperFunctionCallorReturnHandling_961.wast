;; Construct a loop that makes multiple `call_indirect` instructions to different functions based on a table index. The loop should terminate based on a condition involving the results of these calls. This tests if table lookups and type-checking within loops are consistent across implementations.

(assert_invalid
  (module
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (type $t1 (func (result i32)))
    (type $t2 (func (result f32)))
    (func $func1 (result i32) (i32.const 42))
    (func $func2 (result f32) (f32.const 3.14))
    (func (result i32)
      (local $i i32)
      (local $j i32)
      (loop (result i32)
        (local.set $i (i32.const 0))
        ;; Call indirect to different functions based on table index
        (local.set $j (call_indirect (type $t1) (local.get $i) (i32.const 0)))
        (local.set $j (call_indirect (type $t2) (local.get $i) (i32.const 1)))
        ;; Increment and check condition to break loop
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br_if 1 (i32.eq (local.get $i) (i32.const 10)))
      )
    )
  )
  "type mismatch"
)