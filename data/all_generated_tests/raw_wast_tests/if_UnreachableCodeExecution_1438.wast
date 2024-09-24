;; 9. Test an `if` instruction immediately branching to a label containing `unreachable`:    ```    block       if (i32.const 1)         br 0       end       unreachable     end    ```    This ensures branch logic correctly applies and reaches an `unreachable` instruction via a label.

(assert_invalid
  (module
    (func $branch-to-unreachable
      (block
        (if (i32.const 1) (then (br 0)) (else (unreachable)))
      )
    )
  )
  "type mismatch"
)