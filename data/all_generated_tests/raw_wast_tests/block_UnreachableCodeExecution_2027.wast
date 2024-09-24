;; 8. **Test Description**:    Create a block where the correct branch should skip an `unreachable` instruction but an incorrect branch targets it. This tests if proper execution avoids the `unreachable`, highlighting deviations in conditional branch targeting and block handling.

(assert_invalid
  (module (func $branch-misinterpret-unreachable (result i32)
    (block (result i32) 
      (block (result i32) 
        (br_if 0 (i32.const 1))
        (unreachable)
      ) 
      (i32.const 0)
    )
  ))
  "type mismatch"
)