;; 6. **Test Description:**    - Several nested blocks with variable label depths, including a `br` instruction directed to a label that should cause the program to hit `unreachable` if indexing is incorrect.    - **Constraint: Label Indexing**    - **Differential Behavior: The Wizard Engine's bounds-checking mechanism avoids this, whereas WebAssembly might displace labels leading to `unreachable`.**

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)