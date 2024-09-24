;; 2. Create a function that initializes a counter to a positive value and enters an infinite loop. Inside the loop, use `return` when the counter reaches zero, and decrement the counter with each iteration. Check if the `return` executes after the correct number of iterations.

(assert_invalid
  (module
    (func $loop-and-return (param i32) (result i32)
      (local.get 0)
      (block (loop
        (br_if 1 (i32.eqz (local.get 0)))
        (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
        (br 0)
      ))
      (return (i32.const 0))
    )
  )
  "type mismatch"
)