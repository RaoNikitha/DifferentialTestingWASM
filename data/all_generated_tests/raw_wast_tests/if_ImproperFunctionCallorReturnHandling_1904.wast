;; 5. **Unreachable Code within Nested Calls**:    - An `unreachable` instruction inside an indirectly called function within an `if`.    - Test if proper trapping occurs, or if mismatched implementations permit unexpected continuations.

(assert_invalid
  (module 
    (func $nest-unreachable 
      (if 
        (i32.const 1) 
        (then 
          (call $inner)
        ) 
        (else 
          (i32.const 0)
        ) 
        end
      )
    ) 
    (func $inner
      (unreachable)
    )
  )
  "unreachable executed"
)