;; 10. **Test Description**: Build a loop that iteratively calls functions creating nested blocks using `block` and `loop`. These functions should perform varied calculations and return the accumulated results. Validate correctness of calculation results respecting nested structure and stack behavior.    **Constraint Checked**: Proper stack handling and results accumulation from complex nested function calls and block/loop structures within loops.

(assert_invalid
  (module
    (func $nested_loops
      (result i32)
      (local $acc i32)
      (loop (result i32)
        (local.set $acc (i32.const 0))
        (block $outer
          (loop $inner (result i32)
            (br_if $outer (i32.gt_s (local.get $acc) (i32.const 10)))
            (local.set $acc (i32.add (local.get $acc) (i32.const 1)))
            (br $inner))))
      (local.get $acc)))
  "type mismatch"
)