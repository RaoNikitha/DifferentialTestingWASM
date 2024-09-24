;; 6. Design an infinite loop by having a loop condition depend on a variable updated within the loop, ensuring the variable does not change due to stack mismanagement.

(assert_invalid
  (module (func $infinite_loop
    (local $i i32)
    (i32.const 1)
    (local.set $i)
    (loop (result i32)
      (local.get $i)
      (local.get $i)
      (i32.const 1)
      (i32.add)
      (br_if 0)
    )
  ))
  "type mismatch"
)