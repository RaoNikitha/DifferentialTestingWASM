;; 9. Design a sequence of `block` constructs involving valid `br` instructions to various labels such that an incorrect branch handling leads directly into an `unreachable` instruction.

(assert_invalid
  (module
    (func $br_into_unreachable
      (block
        (block 
          (block 
            (br 2)
            unreachable
          )
          unreachable
        )
        unreachable
      )
    )
  )
  "unreachable"
)