;; 7. Nest `nop` within a sequence of `block`, `loop`, and `if` structures, ensuring the nested control flows remain valid and unchanged.    **Constraint:** Validate `nop` within nested control structures does not alter the Control Flow Graph (CFG).

(assert_invalid 
  (module 
    (func $nested_nop 
      (block 
        (loop 
          (if (i32.const 1) 
            (then 
              (nop) 
              (br 1) 
            )
          ) 
        ) 
      ) 
    )
  ) 
  "type mismatch"
)