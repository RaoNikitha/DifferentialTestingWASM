;; 9. **Test Description**: Implement a loop that calls a function which uses recursion. Establish a `br_if` to exit the loop when the recursion depth reaches a base case that modifies a global counter.    - **Constraint**: Correct recursion depth tracking and global counter updates, proper evaluation with `br_if`.    - **Infinite Loop Relation**: Improper recursive depth evaluation or counter update prevents exiting the loop.

(assert_invalid
  (module
    (global $counter (mut i32) (i32.const 0))
    (func $recursive_func (param $depth i32)
      (local $local_counter i32)
      (global.set $counter
        (i32.add (global.get $counter) (i32.const 1))
      )
      (if (i32.gt_s (local.get $depth) (i32.const 0))
        (then
          (call $recursive_func
            (i32.sub (local.get $depth) (i32.const 1))
          )
        )
      )
      (br_if 0 (i32.eq (global.get $counter) (i32.const 10)))
    )
    (func (loop (call $recursive_func (i32.const 5)) (br 0)))
  )
  "infinite loop"
)