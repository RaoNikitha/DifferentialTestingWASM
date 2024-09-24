;; 3. Create a test where an exported function calls another internal function that contains an `unreachable` instruction. The calling module must properly handle the trap and maintain stack integrity.

(assert_invalid
  (module 
    (func $internalFunc
      unreachable
    )
    (func (export "externalFunc")
      call $internalFunc
    )
  )
  "unreachable executed"
)