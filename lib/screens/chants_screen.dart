import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import '../theme/app_theme.dart';

class ChantsScreen extends StatelessWidget {
  const ChantsScreen({super.key});

  final String _chalisaText = '''
दोहा :

श्रीगुरु चरन सरोज रज, निज मनु मुकुरु सुधारि।
बरनऊं रघुबर बिमल जसु, जो दायकु फल चारि।। 
बुद्धिहीन तनु जानिके, सुमिरौं पवन-कुमार।
बल बुद्धि बिद्या देहु मोहिं, हरहु कलेस बिकार।। 
 
चौपाई :
 
जय हनुमान ज्ञान गुन सागर।
जय कपीस तिहुं लोक उजागर।।

रामदूत अतुलित बल धामा।
अंजनि-पुत्र पवनसुत नामा।।
 
महाबीर बिक्रम बजरंगी।
कुमति निवार सुमति के संगी।।
 
कंचन बरन बिराज सुबेसा।
कानन कुंडल कुंचित केसा।।

हाथ बज्र औ ध्वजा बिराजै।
कांधे मूंज जनेऊ साजै।
 
संकर सुवन केसरीनंदन।
तेज प्रताप महा जग बन्दन।।
 
विद्यावान गुनी अति चातुर।
राम काज करिबे को आतुर।।
 
प्रभु चरित्र सुनिबे को रसिया।
राम लखन सीता मन बसिया।।
 
सूक्ष्म रूप धरि सियहिं दिखावा।
बिकट रूप धरि लंक जरावा।।
 
भीम रूप धरि असुर संहारे।
रामचंद्र के काज संवारे।।
 
लाय सजीवन लखन जियाये।
श्रीरघुबीर हरषि उर लाये।।
 
रघुपति कीन्ही बहुत बड़ाई।
तुम मम प्रिय भरतहि सम भाई।।
 
सहस बदन तुम्हरो जस गावैं।
अस कहि श्रीपति कंठ लगावैं।।
 
सनकादिक ब्रह्मादि मुनीसा।
नारद सारद सहित अहीसा।।
 
जम कुबेर दिगपाल जहां ते।
कबि कोबिद कहि सके कहां ते।।
 
तुम उपकार सुग्रीवहिं कीन्हा।
राम मिलाय राज पद दीन्हा।।
 
 तुम्हरो मंत्र बिभीषन माना।
लंकेस्वर भए सब जग जाना।।
 
जुग सहस्र जोजन पर भानू।
लील्यो ताहि मधुर फल जानू।।
 
प्रभु मुद्रिका मेलि मुख माहीं।
जलधि लांघि गये अचरज नाहीं।।
 
दुर्गम काज जगत के जेते।
सुगम अनुग्रह तुम्हरे तेते।।
 
राम दुआरे तुम रखवारे।
होत न आज्ञा बिनु पैसारे।।
 
सब सुख लहै तुम्हारी सरना।
तुम रक्षक काहू को डर ना।।
 
आपन तेज सम्हारो आपै।
तीनों लोक हांक तें कांपै।।
 
भूत पिसाच निकट नहिं आवै।
महाबीर जब नाम सुनावै।।
 
नासै रोग हरै सब पीरा।
जपत निरंतर हनुमत बीरा।।
 
संकट तें हनुमान छुड़ावै।
मन क्रम बचन ध्यान जो लावै।।
 
सब पर राम तपस्वी राजा।
तिन के काज सकल तुम साजा।
 
और मनोरथ जो कोई लावै।
सोइ अमित जीवन फल पावै।।
 
चारों जुग परताप तुम्हारा।
है परसिद्ध जगत उजियारा।।
 
साधु-संत के तुम रखवारे।
असुर निकंदन राम दुलारे।।
 
अष्ट सिद्धि नौ निधि के दाता।
अस बर दीन जानकी माता।।
 
राम रसायन तुम्हरे पासा।
सदा रहो रघुपति के दासा।।
 
तुम्हरे भजन राम को पावै।
जनम-जनम के दुख बिसरावै।।
 
अन्तकाल रघुबर पुर जाई।
जहां जन्म हरि-भक्त कहाई।।
 
और देवता चित्त न धरई।
हनुमत सेइ सर्ब सुख करई।।
 
संकट कटै मिटै सब पीरा।
जो सुमिरै हनुमत बलबीरा।।
 
जै जै जै हनुमान गोसाईं।
कृपा करहु गुरुदेव की नाईं।।
 
जो सत बार पाठ कर कोई।
छूटहि बंदि महा सुख होई।।
 
जो यह पढ़ै हनुमान चालीसा।
होय सिद्धि साखी गौरीसा।।
 
तुलसीदास सदा हरि चेरा।
कीजै नाथ हृदय मंह डेरा।। 
 
दोहा :
 
पवन तनय संकट हरन, मंगल मूरति रूप।
राम लखन सीता सहित, हृदय बसहु सुर भूप।।
''';

  final String _bajrangBaanText = '''
निश्चय प्रेम प्रतीति ते, बिनय करैं सनमान
तेहि के कारज सकल शुभ, सिद्ध करैं हनुमान
जय हनुमंत संत हितकार, सुन लीजै प्रभु अरज हमारी
जन के काज बिलंब न कीजै, आतुर दौरि महा सुख दीजै
जैसे कूदि सिंधु महिपारा, सुरसा बदन पैठि बिस्तारा
आगे जाय लंकिनी रोका, मारेहु लात गई सुरलोका
जाय बिभीषन को सुख दीन्हा, सीता निरखि परमपद लीन्हा
बाग उजारि सिंधु महँ बोरा, अति आतुर जमकातर तोरा
अक्षय कुमार मारि संहारा, लूम लपेटि लंक को जारा
लाह समान लंक जरि गई, जय-जय धुनि सुरपुर नभ भई
अब बिलंब केहि कारन स्वामी, कृपा करहु उर अंतरयामी
जय-जय लखन प्रान के दाता, आतुर ह्वै दुख करहु निपाता
जय हनुमान जयति बल-सागर, सुर-समूह-समरथ भट-नागर
ॐ हनु-हनु-हनु हनुमंत हठीले, बैरिहि मारु बज्र की कीले
ॐ ह्नीं ह्नीं ह्नीं हनुमंत कपीसा, ॐ हुं हुं हुं हनु अरि उर सीसा
जय अंजनि कुमार बलवंता, शंकरसुवन बीर हनुमंता
बदन कराल काल-कुल-घालक, राम सहाय सदा प्रतिपालक
भूत, प्रेत, पिसाच निसाच, र अगिन बेताल काल मारी मर
इन्हें मारु, तोहि सपथ राम की, राखु नाथ मरजाद नाम की
सत्य होहु हरि सपथ पाइ कै, राम दूत धरु मारु धाइ कै
जय-जय-जय हनुमंत अगाधा, दुख पावत जन केहि अपराधा
पूजा जप तप नेम अचारा, नहिं जानत कछु दास तुम्हारा
बन उपबन मग गिरि गृह माहीं, तुम्हरे बल हौं डरपत नाहीं
जनकसुता हरि दास कहावौ, ताकी सपथ बिलंब न लावौ
जै जै जै धुनि होत अकासा, सुमिरत होय दुसह दुख नासा
चरन पकरि, कर जोरि मनावौं, यहि औसर अब केहि गोहरावौं
उठु, उठु, चलु, तोहि राम दुहाई, पायँ परौं, कर جوरि मनाई
ॐ चं चं चं चं चपल चलंता, ॐ हनु हनु हनु हनु हनुमंता
ॐ हं हं हाँक देत कपि चंचल, ॐ सं सं सहमि पराने खल-दल
अपने जन को तुरत उबारौ, सुमिरत होय आनंद हमारौ
यह बजरंग-बाण जेहि मारै, ताहि कहौ फिरि कवन उबारै
पाठ करै बजरंग-बाण की, हनुमत रक्षा करै प्रान की
यह बजरंग बाण जो जापैं, तासों भूत-प्रेत सब कापैं
धूप देय जो जपै हमेसा, ताके तन नहिं रहै कलेसा
ताके तन नहिं रहै कलेसा
उर प्रतीति दृढ़, सरन ह्वै, पाठ करै धरि ध्यान
बाधा सब हर, करैं सब काम सफल हनुमान
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hanuman Chants'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: ChantCard(
              title: 'Hanuman Chalisa',
              text: _chalisaText,
              audioAssetPath: 'audio/Hanuman-Chalisa-Hariharan-Gulshan-Kumar-MyMp3Bhojpuri.In-2.mp3',
              initiallyExpanded: false,
            ),
          ),
          const SizedBox(height: 24),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: ChantCard(
              title: 'Bajrang Baan',
              text: _bajrangBaanText,
              audioAssetPath: 'audio/bajrang_baan.mp3',
              initiallyExpanded: false,
            ),
          ),
        ],
      ),
    );
  }
}

class ChantCard extends StatefulWidget {
  final String title;
  final String text;
  final String? audioAssetPath;
  final String? audioUrl;
  final bool initiallyExpanded;

  const ChantCard({
    super.key,
    required this.title,
    required this.text,
    this.audioAssetPath,
    this.audioUrl,
    this.initiallyExpanded = false,
  });

  @override
  State<ChantCard> createState() => _ChantCardState();
}

class _ChantCardState extends State<ChantCard> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    if (widget.audioAssetPath != null || widget.audioUrl != null) {
      _setupAudio();
    }
  }

  void _setupAudio() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });

    _audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          _duration = newDuration;
        });
      }
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          _position = newPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      if (widget.audioAssetPath != null) {
        await _audioPlayer.play(AssetSource(widget.audioAssetPath!));
      } else if (widget.audioUrl != null) {
        await _audioPlayer.play(UrlSource(widget.audioUrl!));
      }
    }
  }

  void _skipForward() async {
    final newPosition = _position + const Duration(seconds: 10);
    if (newPosition < _duration) {
      await _audioPlayer.seek(newPosition);
    } else {
      await _audioPlayer.seek(_duration);
    }
  }

  void _skipBackward() async {
    final newPosition = _position - const Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      await _audioPlayer.seek(newPosition);
    } else {
      await _audioPlayer.seek(Duration.zero);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget _buildAudioPlayer() {
    double maxDuration = _duration.inMilliseconds.toDouble();
    double currentPosition = _position.inMilliseconds.toDouble();

    // Prevent assertion errors if duration is 0 or position exceeds max
    if (maxDuration <= 0) {
      maxDuration = 100.0;
      currentPosition = 0.0;
    }
    if (currentPosition > maxDuration) {
      currentPosition = maxDuration;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primarySaffron.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '${widget.title} Audio',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(_formatDuration(_position)),
              Expanded(
                child: Slider(
                  value: currentPosition,
                  max: maxDuration,
                  activeColor: AppTheme.primarySaffron,
                  onChanged: (value) async {
                    final position = Duration(milliseconds: value.toInt());
                    await _audioPlayer.seek(position);
                  },
                ),
              ),
              Text(_formatDuration(_duration)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 36,
                color: AppTheme.vermillion.withValues(alpha: 0.8),
                icon: const Icon(Icons.replay_10_rounded),
                onPressed: _skipBackward,
              ),
              const SizedBox(width: 16),
              IconButton(
                iconSize: 56,
                color: AppTheme.vermillion,
                icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
                onPressed: _togglePlayPause,
              ),
              const SizedBox(width: 16),
              IconButton(
                iconSize: 36,
                color: AppTheme.vermillion.withValues(alpha: 0.8),
                icon: const Icon(Icons.forward_10_rounded),
                onPressed: _skipForward,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasAudio = widget.audioAssetPath != null || widget.audioUrl != null;

    return Card(
      elevation: 4,
      shadowColor: AppTheme.primarySaffron.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: widget.initiallyExpanded,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppTheme.deepCharcoal,
                  fontWeight: FontWeight.bold,
                ),
          ),
          iconColor: AppTheme.primarySaffron,
          collapsedIconColor: AppTheme.primarySaffron,
          childrenPadding: const EdgeInsets.all(24),
          children: [
            if (hasAudio) _buildAudioPlayer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.warmWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.outlineVariant.withValues(alpha: 0.5)),
              ),
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 2.0,
                      color: AppTheme.deepCharcoal.withValues(alpha: 0.9),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
