;; 7. **Test Description 7: Nested Structures with Operand Mismatch**    - Utilize `block`, `if`, and `loop` structures in nested fashion, apply `br_if` to verify indexing and operand stack integrity when targeting a higher-level structure.

(assert_invalid 
  (module 
    (func $nested-structures-with-mismatch 
      (block 
        (loop 
          (if (i32.const 1) 
            (block (br_if 1 (i32.const 1))) 
          ) 
        ) 
      ) 
    ) 
  ) 
  "type mismatch"
)