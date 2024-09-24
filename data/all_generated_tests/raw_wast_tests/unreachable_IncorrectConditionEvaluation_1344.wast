;; - Implement a switch-like structure using nested `if-else` conditions, each leading to different `unreachable` instructions. Validate if any incorrect condition evaluation leads to unexpected traps.

(assert_invalid
  (module 
    (func $nested-if-else-unreachable
      (block 
        (if (i32.const 0) 
          (then 
            (unreachable)
          ) 
          (else 
            (if (i32.const 1) 
              (then 
                (unreachable)
              ) 
              (else 
                (if (i32.const 0) 
                  (then 
                    (unreachable)
                  ) 
                  (else 
                    (i32.const 0)
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)