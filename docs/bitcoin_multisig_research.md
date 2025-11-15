# Recherche: Dart-Bibliotheken für Bitcoin & Multi-Sig Wallets

| Thema | Bibliothek | Reifegrad | Notizen |
| --- | --- | --- | --- |
| Bitcoin Protokoll & Transaktionen | [`bitcoin_base`](https://pub.dev/packages/bitcoin_base) | Aktiv gepflegt | Unterstützt BIP32/39/44, PSBT, SegWit & Taproot. Gute Grundlage für Key-Management & Signaturen. |
| Wallet/Key Ableitung | [`bip39`](https://pub.dev/packages/bip39) & [`bip32`](https://pub.dev/packages/bip32) | Stabil | Kombinierbar mit `bitcoin_base`. Nutzen für Mnemonic Seeds und HD Wallets. |
| Script/Multisig Hilfen | [`btcpay_dart`](https://pub.dev/packages/btcpay_dart) | Mittel | Enthält Helfer für Pay-to-Script-Hash und Multi-Sig Redeem Scripts, jedoch weniger aktiv gepflegt. |
| Kryptographie | [`pointycastle`](https://pub.dev/packages/pointycastle) | Reif | Niedrig-Level Crypto (ECDSA, SHA). Einsatz wenn Custom Signaturen für Multi-Sig benötigt werden. |
| Hardware Wallet Integration | [`ledger_dart`](https://pub.dev/packages/ledger_dart)`*` | Experimentell | Zugriff auf Ledger-Geräte über HID. Eignet sich für spätere HSM-Integration. |

`*` Hinweis: erfordert native Plattformunterstützung (Desktop/Mobile).

## Empfehlungen
1. **Wallet Core**: `bitcoin_base` + `bip39`/`bip32` für deterministische Wallets und PSBT-Handling.
2. **Multi-Sig Logik**: Eigenes Service-Layer auf Basis von `bitcoin_base` Scripts (`OP_CHECKMULTISIG`). Speicherung der Teilnehmer & Thresholds in Serverpod.
3. **Signaturfluss**: 
   - Schritt 1: Serverpod erstellt PSBT (unterschrieben mit Placeholdern), verteilt an Signers.
   - Schritt 2: Signierende Clients nutzen `bitcoin_base` (oder Hardware Wallets) um Teil-Signaturen zu erzeugen.
   - Schritt 3: Aggregation & Broadcast via Serverpod Service.
4. **Sicherheit**: Private Keys ausschließlich clientseitig verwalten. Serverpod verwaltet nur verschlüsselte, geteilte PubKeys und PSBTs.

Weitere offene Fragen:
- Benötigen wir Lightning-Unterstützung? => Prüfen [`lightning_sdk`](https://github.com/lightningdevkit/ldk-node-batteries-included) (FFI erforderlich).
- Welche Custody-Vorgaben gelten? => Entscheidet ob Hardware-Signer Pflicht werden.
