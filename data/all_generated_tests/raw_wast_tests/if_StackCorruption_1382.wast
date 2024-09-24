;; 3. Execute an `if` block with complex instructions performing multiple stack operations, such as pushing and popping several values within both the `then` and `else` sections. Check for inconsistencies in stack management, especially at nested depths.

(assert_invalid
 (module
  (func $complex-stack-ops-in-if (result i32)
   (i32.const 1)
   (i32.const 2)
   (i32.const 3)
   (if (result i32)
    (i32.const 1)
    (then
     (i32.add)
     (i32.mul)
    )
    (else
     (drop)
     (drop)
     (i32.const 4)
    )
   )
  )
 )
 "type mismatch"
)