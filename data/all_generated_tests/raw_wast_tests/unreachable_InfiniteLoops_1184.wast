;; 5. Compose a complex loop where each iteration includes unreachable instructions nested within multiple control constructs (e.g., `block`, `if`, `loop`). Test that despite nested constructs, the `unreachable` consistently triggers a trap to avoid infinite cycling.

(assert_invalid
  (module
    (func $complex-loop-with-unreachable 
      (loop (result i32)
        (block 
          (if 
            (i32.eqz (i32.const 1))
            (then
              (block
                (br 2 (unreachable)) 
              )
            )
            (else
              (block
                (unreachable)
              )
            )
          )
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)